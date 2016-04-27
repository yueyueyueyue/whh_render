A = [0 1 1]';
B = [1 1 1]';
C = [1 1 0]';
D = [0 1 0]';
E = [0 0 1]';
F = [1 0 1]';
G = [1 0 0]';
H = [0 0 0]';
data = [A B C D A E F G H E H G C D H D C B F];
data = data + ones(size(data));
axis equal, hold on, set(gca, 'XLim', [-1, 3]), set(gca, 'YLim', [-1, 3]), set(gca, 'ZLim', [-1, 3])
%view([观察者往右,观察者往上])
view(45, 45)
text(A(1)+1, A(2)+1, A(3)+1, 'A');
text(B(1)+1, B(2)+1, B(3)+1, 'B');
text(C(1)+1, C(2)+1, C(3)+1, 'C');
text(D(1)+1, D(2)+1, D(3)+1, 'D');
text(E(1)+1, E(2)+1, E(3)+1, 'E');
text(F(1)+1, F(2)+1, F(3)+1, 'F');
text(G(1)+1, G(2)+1, G(3)+1, 'G');
text(H(1)+1, H(2)+1, H(3)+1, 'H');

plot3(data(1,:), data(2,:), data(3,:), 'k-')
data = [H D]
plot3(data(1,:), data(2,:), data(3,:), 'g-') %y
data = [H G]
plot3(data(1,:), data(2,:), data(3,:), 'r-') %x
data = [H E]
plot3(data(1,:), data(2,:), data(3,:), 'b-') %z