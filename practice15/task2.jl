function convert_to_dict(tree::NestedVectors)
    T=typeof(tree[end])
    connect_tree = Dict{T,Vector{T}}()
    
    function recurs_trace(tree)
        connect_tree[tree[end]]=[]
        for subtree in tree[1:end-1] # - перебор всех поддеревьев
            push!(connect_tree[tree[end]], recurs_trace(subtree))
        end
        return tree[end] # - индекс конрня
    end

    recurs_trace(tree)
    return connect_tree
end

function convert_to_list(tree::Dict{T,Vector{T}}) where T
    list_tree=Vector{Vector{T}}(undef,length(tree))
    for subroot in eachindex(list_tree)
        list_tree[subroot]=tree[subroot]
    end
    return list_tree
end