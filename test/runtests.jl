using RandomNames
using RandomNames: formatword
using Test

@testset "RandomNames.jl" begin
    @test formatword("hello world") == "hello_world"

    strlist = ["x", "x-y", "x-y-", "x-y-z", "x-y-1"]
    @test countword(strlist) == 1
    @test countword(strlist; allowindex=true) == 2
end
