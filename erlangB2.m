%Range of Traffic offered (A) in Erlangs
A_values = 0.1:0.1:100;
%Number of trunked channels (C)
C_values = [1, 2, 5, 10, 50, 100];
%Function for Erlang B Blocking Probability
function P_B = erlangB(A,C)
numerator = A^C/factorial(C);
denominator=sum(arrayfun(@(k)A^k/factorial(k),0:C));
P_B = numerator / denominator;
end
%Intialize matrix to store blocking probabilities
blocking_probabilities = zeros(length(A_values),length(C_values));
%Compute blocking probabilities for each combination of A and C
for i =1:length(A_values)
A = A_values(i);
for j =1:length(C_values)
C = C_values(j);
blocking_probabilities(i,j)=erlangB(A,C);
end
end
%Plotting
figure;
hold on;
colors=['r','g','b','c','m','k'];
legends=cell(length(C_values), 1);
for j =1:length(C_values)
plot(A_values, blocking_probabilities(:,j), 'Color', colors(j), 'LineWidth', 2);
legends{j} = sprintf('C = %d',C_values(j));
end
xlabel('Traffic Intensity(A)');
ylabel('Probability of Call Blocking (P_B)');
title('Traffic Intensiy vs Probability of Call Blocking (ErlangB)');
legend(legends);
grid on;
hold off;
