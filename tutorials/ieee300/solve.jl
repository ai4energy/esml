# IEEE 300 潮流：Julia 客户端一次性调用。
#
#     export ESML_HOME=/path/to/esml-academic-1.9.0-linux-x86_64
#     julia solve.jl "$ESML_HOME"

using ESML

home = length(ARGS) >= 1 ? ARGS[1] : get(ENV, "ESML_HOME", ".")
case = joinpath(home, "library/domains/power/cases/case300.comp.esml")
isfile(case) || error("找不到用例：$case（把 ESML_HOME 指向解包后的学术版目录）")

out = solve(case; libraries = [joinpath(home, "library")], binary = joinpath(home, "esml"))
println("unknowns = ", out.unknowns)
println(
    "engine = ", out.meta["engineVersion"],
    "  docHash = ", first(out.meta["docHash"], 12), "…",
    "  unitCoverage = ", out.meta["unitCoverage"],
)
println(
    "iterations = ", out.meta["iterations"],
    "  residual = ", out.meta["residual"],
    " (tolerance ", out.meta["residualTolerance"], ")",
)
for path in ("b1.net.Vm", "b1.net.Va", "b2.net.Vm", "b2.net.Va")
    println(path, " = ", round(out.values[path]; digits = 10))
end
