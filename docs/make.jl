using Exercise1
using Documenter

DocMeta.setdocmeta!(Exercise1, :DocTestSetup, :(using Exercise1); recursive=true)

makedocs(;
    modules=[Exercise1],
    authors="Paul Schrimpf <paul.schrimpf@gmail.com> and contributors",
    repo="https://github.com/schrimpf/Exercise1.jl/blob/{commit}{path}#{line}",
    sitename="Exercise1.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://schrimpf.github.io/Exercise1.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Benchmarks" => "benchmarks.md"
    ],
)

deploydocs(;
    repo="github.com/schrimpf/Exercise1.jl",
    devbranch="main",
)



