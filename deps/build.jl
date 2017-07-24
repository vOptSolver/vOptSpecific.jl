cd("LAP") do
    print(pwd())
    run(`make`)
end

cd("UMFLP") do
    print(pwd())
    run(`make`)
end

# cd("knapsack") do
#     run(`make`)
# end

