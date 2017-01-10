function skel = finaliseStructure(skel)

% FINALISESTRUCTURE 

skel.tree = treeFindParents(skel.tree);
ordered = false;
while ordered == false
  for i = 1:length(skel.tree)
    ordered = true;
    if(skel.tree(i).parent>i)
      ordered = false;
      skel.tree = swapNode(skel.tree, i, skel.tree(i).parent);
    end
  end
end

for i = 1:length(skel.tree)
  skel.tree(i).C = rotationMatrix(deg2rad(skel.tree(i).axis(1)), ...
                             deg2rad(skel.tree(i).axis(2)), ...
                             deg2rad(skel.tree(i).axis(3)), ...
                             skel.tree(i).axisOrder);
  skel.tree(i).Cinv = inv(skel.tree(i).C);
end
