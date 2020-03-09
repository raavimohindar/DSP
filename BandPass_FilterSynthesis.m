clear all;

A = importdata("sparameters_bandpass.dat");

frequencyPart = A(:,1);
realPart = A(:,2);
imaginaryPart = A(:,3);

s11 = realPart + imaginaryPart*i;

f = frequencyPart*1e9;
l=length(f);

w=2*pi*f;
f0 = (f(1)+f(end))/2;

Fs = 6*frequencyPart(end) *1.0e9;

M = 512;

T1 = 0.0;
T2 = 5e-9;

time = T1 : 1/Fs : T2-1.0/Fs;

t = T1 + (T2-T1)/M * (0:M-1)';

signal = s11.*HammingFen(l);

s11_inverse=FourierR(w, signal, t);

s11_time = ifft(signal, M);

figure(10)
subplot(311)
plot(f/1e9, 20*log10(abs(s11)+1e-12), 'LineWidth',2)
axis([f(1,1)/1e9 f(l,1)/1e9 -80 0])
set(gca,'Fontsize',12);
grid on;
xlabel('Frequency (GHz)')
ylabel('S11 (dB)')

subplot(312)
plot(time/1e-9, 20*log10(abs(s11_inverse)), 'LineWidth',2)
%axis([T1/1e-9 T2/1e-9 120 180])
set(gca,'Fontsize',12);
grid on;
xlabel('Time (ns)')
ylabel('S11 (dB)')

subplot(313)
plot(t/1e-9, 20*log10(abs(s11_time)), 'LineWidth',2)
%axis([T1/1e-9 T2/1e-9 120 180])
set(gca,'Fontsize',12);
grid on;
xlabel('Time (ns)')
ylabel('S11 (dB)')



wrappedPhase = angle(s11_inverse);

unwrappedPhase = wrappedPhase;

for outerLoop = 2:length(unwrappedPhase)

  differenceInPhase = unwrappedPhase(outerLoop)-unwrappedPhase(outerLoop-1);

  if differenceInPhase > pi

    for innerLoop=outerLoop:length(unwrappedPhase)
      unwrappedPhase(innerLoop) = unwrappedPhase(innerLoop) - 2*pi;
    end
  end

  if differenceInPhase < -pi

    for innerLoop=outerLoop:length(unwrappedPhase)
      unwrappedPhase(innerLoop) = unwrappedPhase(innerLoop) + 2*pi;
    end
  end

end 

unwrappedPhaseMatlab = unwrap(wrappedPhase);

%
figure(11)
subplot(211);
plot(t/1e-9,unwrappedPhase,'b','LineWidth',2);
axis([T1/1e-9 T2/1e-9 0 500]);
set(gca,'Fontsize',12);
grid;
xlabel('Time (ns)')
ylabel('Phase (rad): User-defined')

subplot(212);
plot(t/1e-9,unwrappedPhase-2*pi*f0*t,'b','LineWidth',2);
axis([T1/1e-9 T2/1e-9 -10 4]);
set(gca,'Fontsize',12);
grid;
xlabel('Time (ns)')
ylabel('\Delta Phase (rad): User-defined')

##figure(12)
##subplot(211)
##plot(t/1e-9,unwrappedPhaseMatlab,'b','LineWidth',2)
##%axis([T1/1e-9 T2/1e-9 0 500])
##set(gca,'Fontsize',12)
##grid
##xlabel('Time (ns)')
##ylabel('Phase (rad)')
##
##subplot(212)
##plot(t/1e-9,(unwrappedPhaseMatlab-2*pi*f0*t),'b','LineWidth',2)
##%axis([T1/1e-9 T2/1e-9 -10 4])
##set(gca,'Fontsize',12)
##grid
##xlabel('Time (ns)')
##ylabel('\Delta Phase (rad)')
