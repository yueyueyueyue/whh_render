function str = whh_vector2str(v)
%WHH_VECTOR2STR Summary of this function goes here
%   Detailed explanation goes here
l = length(v);
str = '[';
for i=1:l-1
    str = [str, num2str(v(i)), ' '];
end
str = [str, num2str(v(l)), ']'''];

end

