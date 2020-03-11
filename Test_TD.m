clear all;
close all;

phaseFileContents = fopen('sparameters_bandpass.dat','r');

sizePhase = [3 Inf];

phaseDataContents = fscanf(phaseFileContents,'%f',sizePhase);

fclose(phaseFileContents);

lenghtofDataContents = length(phaseDataContents);

frequencyPart = phaseDataContents(1,[1:lenghtofDataContents]);

realPart = phaseDataContents(2,[1:lenghtofDataContents]);

imaginaryPart = phaseDataContents(3,[1:lenghtofDataContents]);

complexPart = complex(realPart, -1.0*imaginaryPart)';


%f0=16.035e9;
%B=1.2e9;
%f(:,1)=(f0-B/2):0.401e7:(f0+B/2); 
f = frequencyPart'*1e9;
l=length(f);
f0 = (f(1,1)+f(l,1))/2;
w=2*pi*f;
Win_S=HammingFen(l);

M = 500;
T1 = -0.0e-9;
T2 = 5e-9;
t=T1+(T2-T1)/M*(0:M)';

magnitudeInTimeDomain=FourierR(w,complexPart.*Win_S,t);

wrappedPhase = angle(magnitudeInTimeDomain);

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

figure(10)
subplot(211)
plot(f/1e9,20*log10(abs(complexPart)+1e-12),f/1E9,20*log10(abs(complexPart)+1e-12),'LineWidth',2)
axis([f(1,1)/1e9 f(l,1)/1e9 -80 0])
set(gca,'Fontsize',12);
grid on;
xlabel('Frequency (GHz)')
ylabel('S11 (dB)')

subplot(212)
plot(t/1e-9,20*log10(abs(magnitudeInTimeDomain)),t/1E-9,20*log10(abs(magnitudeInTimeDomain)),'LineWidth',2)
axis([T1/1e-9 T2/1e-9 120 180])
set(gca,'Fontsize',12);
grid on;
xlabel('Time (ns)')
ylabel('S11 (dB)')
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

figure(12)
subplot(211)
plot(t/1e-9,unwrappedPhaseMatlab,'b','LineWidth',2)
%axis([T1/1e-9 T2/1e-9 0 500])
set(gca,'Fontsize',12)
grid
xlabel('Time (ns)')
ylabel('Phase (rad)')

subplot(212)
plot(t/1e-9,(unwrappedPhaseMatlab-2*pi*f0*t),'b','LineWidth',2)
%axis([T1/1e-9 T2/1e-9 -10 4])
set(gca,'Fontsize',12)
grid
xlabel('Time (ns)')
ylabel('\Delta Phase (rad)')
