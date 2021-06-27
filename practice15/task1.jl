ConnectList{T}=Vector{Vector{T}}
NestedVectors = Vector

function convert_to_nested(tree::ConnectList{T},root::T) where T
    nested_tree = []
    for subroot in tree[root]
        push!(nested_tree, convert(tree, subroot))
    end
    push!(nested_tree, root)
    return nested_tree
end

tree=[[2,3],
      [],
      [4,5],
      [],
      []]

nested_tree = convert_to_nested(tree, 1) 
println(nested_tree)