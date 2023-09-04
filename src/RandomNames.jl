module RandomNames

using Random
using Random: GLOBAL_RNG

import Random: rand

export RandomName, countword

# TODO Store the subfolder names as well such that one can filter out certain words to use
function readwordlist(folder)
    words = []
    dir = joinpath(dirname(@__DIR__), "deps", "wordlists", folder)
    for fn in readdir(dir)
        fp = joinpath(dir, fn)
        append!(words, readlines(fp))
    end
    return filter(!isempty, words)
end

# TODO Use metaprog to store all the word lists
const ADJECTIVES = readwordlist("adjectives")
const NOUNS = readwordlist("nouns")

function formatword(w)
    return replace(w, ' ' => "_")
end

# TODO Enrich this to support more controls of name generation
struct RandomName end

function rand(rng::AbstractRNG, ::RandomName)
    return join(formatword.([rand(rng, ADJECTIVES), rand(rng, NOUNS)]), '-')
end
rand(rn::RandomName) = rand(GLOBAL_RNG, rn::RandomName)

const RANDOM_WORD_REGEX = r"^[\w_]+-[\w_]$"
const RANDOM_WORD_REGEX_WITH_INDEX = r"^[\w_]+-[\w_]+(?:-\d+)?$"

function countword(strlist; allowindex=false)
    regex = allowindex ? RANDOM_WORD_REGEX_WITH_INDEX : RANDOM_WORD_REGEX
    c = 0
    for str in strlist
        m = match(regex, str)
        if !isnothing(m)
            c += 1
        end
    end
    return c
end

end
