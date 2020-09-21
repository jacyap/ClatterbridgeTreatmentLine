fid=fopen('LETdBPtopas.csv','r');
data = textscan(fid,'%f%f%f%f%f%f%f','delimiter',',','HeaderLines', 1);
fclose(fid);

CCCx=rmmissing(data{1});
CCCedep=rmmissing(data{2});
x=rmmissing(data{3});
SIMeDep=rmmissing(data{4});
SIMletD=rmmissing(data{6});
%SIMletDnorm=rmmissing(data{6});

hfig=figure;
%set(gca, 'GridLineStyle','--', 'GridColor','[0.3 0.3 0.3]','FontSize',14);
set(gca,'FontSize',18,'box','on')
set(hfig, 'Position', [400 150 900 500])
xlabel('Depth (mm)','fontweight','bold','FontSize',16);

yyaxis left; 
CCC=scatter(CCCx,CCCedep,45,'blue');
axis([0 40 0 1.1])
ylabel('Normalised dose (arb)','FontSize',16);

hold on
SIMedep=plot(x,SIMeDep,'Color','blue','LineStyle','-','LineWidth',2);
yyaxis right;
ylabel('Dose averaged LET (keV/\mum)','FontSize',16);
SIMletd=scatter(x,SIMletD,45,'red','s','filled');

CCC.DisplayName='CCC data';
SIMedep.DisplayName='Sim';
SIMletd.DisplayName='Sim LETd';
lgd=legend;
lgd.FontSize=16;
lgd.Location='northwest';
legend([CCC  SIMedep  SIMletd]);

%% Save as picture

saveasname_dated="LETdBPtopas_"+string(date);
%saveasname= saveasname_dated+'.png';
%saveas(gcf,saveasname);
%print(gcf,'saveasnameHR.png','-dpng','-r600') %high resolution