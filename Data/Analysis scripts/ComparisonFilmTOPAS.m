%% Sim data
fin = importdata('simF3_dosedep.txt');
x=fin(:,1);
y=fin(:,2);

%Normalise to max
normalisedSimY = (y./max(y));%maxYdose
sim = [x normalisedSimY];

%% Film data

filmin = importdata('FilmF3.txt');

filmX = filmin(:,1);
filmY = filmin(:,2);
filmX = filmX;
%plot(filmX,filmY);

%% Film uniformity corrections

% Normalised to max dose
normalisedY = (filmY./max(filmY));
film = [filmX normalisedY];

lowestpeak=-2.8;
left = find(filmX<lowestpeak);
leftX = filmX(left);
leftY = film(left,2); %want y values less than 0
%plot(leftX,leftY);
right = find(filmX>=lowestpeak); %want y values greater than 0
rightY = film(right,2);
rightX = filmX(right);
%plot(rightX,rightY);

% scale to same max values
diff=(1-max(leftY))/2;
scalingfactorL=1+diff;
scaleL=leftY.*scalingfactorL;
scalingfactorR=1-diff; %increase left side by amount
%plot(leftX,scaleL);
scaleR=rightY*scalingfactorR; %decrease right side by amount
%plot(rightX,scaleR);
combined = [scaleL;scaleR];
%plot(filmX,combined);
normalised = combined./max(combined); %normalise again to offset over and underdose with nonuniformity
%filmNorm=[filmX,normalised];

% Fit gaussian and calc FWHM
excludeFilm1 = find(filmX<-2 | filmX>2); %2 boundaries to match gaussian
%excludeFilm2 = find(filmX>4.1 & filmX<4.8); %2 boundaries to match gaussian
excluded = [excludeFilm1];%;excludeFilm2]
exFy = normalised(excluded);
exFx = filmX(excluded);
fitFilm = fit(exFx,exFy,'gauss1');
coeff_Film = coeffvalues(fitFilm);
fwhmF=2*sqrt(2*log(2))*(coeff_Film(3))

% Calculate FWHM by rudimentary method
[f,closesty]=min(abs((normalised-0.5)));
index=film(closesty);
fwhmFilm=abs(index)*2; 

%% fit sim

% Fit gaussian
excludeSim = find(x>9.5 | x<-9.5);
exSy = normalisedSimY(excludeSim);
exSx = x(excludeSim);
fitSim = fit(exSx,exSy,'gauss1');
coeff_Sim = coeffvalues(fitSim);
fwhmS=2*sqrt(2*log(2))*(coeff_Sim(3))

%pd=fitdist(y,'Normal');
%pf = pdf(pd,x);
%plot(x,pf)

% Calculate FWHM by rudimentary method
[s,closestyS]=min(abs((normalisedSimY-0.5)));
indexS=sim(closestyS);
fwhmSim=abs(indexS)*2; 

%% Plotting options

figure;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.16, 0.16, 0.5, 0.6]);
arrangement = [0.16 0.18 0.75 0.78]; % [left bottom width height]
subplot('Position',arrangement);
simPlot=plot(x,normalisedSimY,'.-','LineWidth',0.5,'Color','red','DisplayName','Simulation');
xlim([-40,40]); xl=xlabel('X Position (mm)','fontweight','bold','FontSize',8);
set(xl,'Units','normalized');
    shift=0.05;%0.15; %shift ylabel left 
    set(xl,'Position',get(xl,'position')-[0 shift 0])
%ylim([0,1.05]); 
yl=ylabel('Normalised Dose','fontweight','bold','FontSize',8);
    set(yl,'Units','normalized');
    shift=0.05;%0.15; %shift ylabel left 
    set(yl,'Position',get(yl,'position')-[shift 0 0]) %position ylabel
grid on
set(gca, 'GridLineStyle','--', 'GridColor','[0.3 0.3 0.3]','FontSize',14);
hold on
filmPlot=plot(filmX,normalised,'-','LineWidth',0.5,'Color','blue','DisplayName','Film');

% plot gaussian fits
ff=plot(fitFilm);
ff.DisplayName='Film fit'; ff.Color='blue'; ff.LineStyle='--'; 
fs=plot(fitSim);
fs.DisplayName='Sim fit'; fs.Color='red'; fs.LineStyle='--';

al=legend([filmPlot simPlot]);% ff fs],'Location','northeast');
al.FontSize=10;

%% Save as picture %change F here
saveasname_dated="F3_norm"+"_BeamProfileComparison"+string(date);
saveasname= saveasname_dated+'.png';
saveas(gcf,saveasname);
%print(gcf,'saveasnameHR.png','-dpng','-r600') %high resolution