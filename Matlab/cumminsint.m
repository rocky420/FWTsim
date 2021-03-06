function [mu] = cumminsint(Kret,thist,nuhist)
% Kret - structure with retardation function (Kret.K) and its time vector (Kret.T)
% thist - time history since beginning of simulation until present time
% nuhist - velocity history since beginning of simulation until present time

Nsys = 2;
mu = zeros(Nsys,1);
% for k1 = 1:Nsys
%     for k2 = 1:Nsys
for k1 = 1:1
    for k2 = 1:1
        T = Kret(k1,k2).T;
        K = Kret(k1,k2).K;
        if thist(end) < T(end) % simulation time is still shorter than duration of retardation function
            Kint = interp1(T,K,thist,'linear',K(end)); % interpolate K over the available simulation time history
            %             dt = thist(2) - thist(1); % in this case, dt comes from thist
            dt = 0.125;
            Int = Kint.*flip(nuhist(k2,:)); % integrand
            mu(k1) = mu(k1) + trapz(Int)*dt; % contribution of DOF k1 to mu(k2)
        else  % simulation time is longer than duration of retardation function
            thist_ini = thist(end) - T(end);
            [~,k_ini] = min(abs(thist_ini-thist));
            dT = T(2) - T(1); % in this case, dT comes from T
            nu_int = interp1(thist(k_ini:end),nuhist(k2,k_ini:end),T+thist_ini,'linear','extrap'); % interpolate nu over the time history of the retardation function
            Int = K(1:end).*flip(nu_int(1:end)); % integrand
            % Int = K(1:end-1).*flip(nu_int(1:end-1)); % integrand
            % Int = K(2:end).*flip(nu_int(2:end)); % integrand
            mu(k1) = mu(k1) + trapz(Int)*dT; % contribution of DOF k2 to mu(k1)
            %             mu(k1) = mu(k1) + trapz(K)*dT*trapz(nuhist(k2,k_ini:end))*dT;
            %                         Kint = interp1(T+thist_ini,K,thist(k_ini:end),'linear','extrap'); % interpolate K over the simulation time history
            %                         dt = thist(2) - thist(1); % in this case, dt comes from thist
            %                         Int = Kint(1:end-1).*flip(nuhist(k2,k_ini+1:end)); % integrand
            %                         mu(k1) = mu(k1) + trapz(Int)*dt; % contribution of DOF k2 to mu(k1)
        end
    end
end
