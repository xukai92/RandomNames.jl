const WORDLISTS_GITHUB_URL = "https://github.com/imsky/wordlists.git"

cd(@__DIR__) do
    run(`git clone $WORDLISTS_GITHUB_URL --depth 1`)
end
