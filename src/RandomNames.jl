module RandomNames

using Random
using Random: GLOBAL_RNG

import Random: rand

export RandomName

# TODO Store the subfolder names as well such that one can filter out certain words to use
function readwordlist(folder)
    words = []
    dir = joinpath(dirname(@__DIR__), "deps", "wordlists", folder)
    for fn in readdir(dir)
        fp = joinpath(dir, fn)
        append!(words, readlines(fp))
    end
    return words
end

# TODO Use metaprog to store all the word lists
const ADJECTIVES = readwordlist("adjectives")
const NOUNS = readwordlist("nouns")

# TODO Enrich this to support more controls of name generation
struct RandomName end

function rand(rng::AbstractRNG, ::RandomName)
    return rand(rng, ADJECTIVES) * '-' * rand(rng, NOUNS)
end
rand(rn::RandomName) = rand(GLOBAL_RNG, rn::RandomName)

end
