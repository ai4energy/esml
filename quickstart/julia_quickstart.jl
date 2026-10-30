# 第一英里检查：用学术版引擎做一次稳态求解与一次时间积分。
#
#     export ESML_BIN=/path/to/esml
#     julia -e 'using Pkg; Pkg.add(url="https://github.com/ai4energy/ESML.jl")'
#     julia quickstart/julia_quickstart.jl

using ESML

doc = joinpath(@__DIR__, "decay.esml")

steady = solve(doc; system = "S")
println("稳态: ", steady.values)

traj = simulate(doc, (0.0, 1.0), 20; observe = ["m.x"], system = "S")
println("x(1) = ", traj.series["m.x"][end], "（解析解 ", exp(-0.5), "）")
