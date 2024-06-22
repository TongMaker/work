libname MODELS "/AUTOS_TEC/MODELIZACION ADAS/02. Prima Pura/02. ProgramaModelo/Model_store";


/*Train*/
%let Var_Obj  = Coste;
%let Var_Weig = Siniestros;
%let Var_in   =  /*Anio_f EntidadCanal  TipoDocumento_f AntiguedadPoliza_f TipoCombustibleVeh_f
AntiguedadVeh_f  EdadConductor2_f  cilindradaVeh_f codtipoveh_f valorTveh_f 

lluviaagr_f  EstudiosSuperioresCur_f

ProvinciaRiesgoGr_f
*/
;

%let Var_out = Anio_f
EntidadCanal
TipoDocumento_f
AntiguedadPoliza_f
TipoCombustibleVeh_f
AntiguedadVeh_f
EdadConductor2_f
CilindradaVeh_f
CodTipoVeh_f
ValorTVeh_f
LluviaAgr_f
EstudiosSuperioresCur_f
;

%let Var_out = FrecuenciaPago_f EdadConductor1_f AntiguedadCarnet1_f adascoli adasparking ProvinciaRiesgoGr_f
 NumeroADAS_f RelPesoPotenciaVeh_f TaraVeh_f  VelocidadVeh_f ViaDelanteraVeh_f
AnchoNeumaticoVeh_f Aceleracion0_100Veh_f DiasGrabEfecto_f  IdConductor2_f 
ZonaRural_f LogitudMVeh_f GrupoPotenciaVeh_f PrecioFrancoFabricaVeh_f ValAccSonido_f OrigenPol_f ClaseVeh_f
SegmentoVeh_f Puertas_f Plazas_f EdadCond1xAntCarnet1 EdadCond2xAntCarnet2  IndADAS
AEBV_f FSD_f ISA_f AEB_f LKA_f ACC_f PVC_f BSW_f AUP_f LDW_f EBA_f FCW_f DD_f NV_f RCTA_f RVC_f TSR_f
CC_f HHA_f AP_f SL_f AHB_f HDC_f HUD_f ALA_f CL_f TPMS_f RTA_f

TCP_f plazasVeh_f Sinco_f AntiguedadCarnet2_f CZscore_f PotenciaVeh_f

Anio_f EntidadCanal  TipoDocumento_f AntiguedadPoliza_f TipoCombustibleVeh_f
AntiguedadVeh_f  EdadConductor2_f  cilindradaVeh_f codtipoveh_f valorTveh_f 
lluviaagr_f  EstudiosSuperioresCur_f

ProvinciaRiesgoGr_f
/*Variables del modelo*/
	
	/*	VientoAgr_f VientoPrm_f VientoSuav_f LluviaAgr_f LluviaProm_f LluviaSuav_f TemperaturaAgr_f TemperaturaProm_f TemperaturaSuav_f 
		TotalPersonas_f PorcentajeMujeres_f PorcentajeHombres_f EdadMedia_f Menores16anios_f Entre16y64anios_f Mayores64anios_f 
    	PorcentajeExtranjeros_f NacidasExtranjero_f EstudiosSuperioresCur_f EstudiosUniversitariosCur_f EstudiosSuperioresReal_f
		ParadosEntreActiv_f OcupadosEntrePoblacion_f ActivosEntrePoblacion_f PensionistasInvEntrePoblacion_f PensionistasJubEntrePoblacion_f 
		OtraInactividadEntrePoblacion_f EstudiantesEntrePoblacion_f PorcentajeSolteros_f PorcentajeCasados_f PorcentajeViudos_f SinInfoEstadoCivil_f 
		PorcentajeDivorciados_f TotalViviendas_f ViviendasPrincipales_f viviendasNoPrincipales_f ViviendasPropiedad_f ViviendasAlquiler_f 
		ViviendasOtroRegimen_f TotalHogares_f Hogares1persona_f Hogares2personas_f Hogares3personas_f Hogares4personas_f HogaresMas4personas_f
*/
;

data train_data;
set  work.pre_train_data; 
	if &Var_Weig. ne 0 ;

	IF Anio_f='2019' THEN offsetAnio_f=0.907;
ELSE IF Anio_f='2021' THEN offsetAnio_f=0.933;
ELSE IF Anio_f='2022' THEN offsetAnio_f=0.952;
ELSE IF Anio_f='Z.2023' THEN offsetAnio_f=1;

IF AntiguedadPoliza_f='02. (0, high]' THEN offsetAntiguedadPoliza_f=0.909;
ELSE IF AntiguedadPoliza_f='Z01. (low, 0]' THEN offsetAntiguedadPoliza_f=1;

IF AntiguedadVeh_f='01. (low, 6]' THEN offsetAntiguedadVeh_f=1.426;
ELSE IF AntiguedadVeh_f='03. (6, 8]' THEN offsetAntiguedadVeh_f=1.394;
ELSE IF AntiguedadVeh_f='04. (8, 10]' THEN offsetAntiguedadVeh_f=1.365;
ELSE IF AntiguedadVeh_f='05. (10, 11]' THEN offsetAntiguedadVeh_f=1.262;
ELSE IF AntiguedadVeh_f='06. (11, 13]' THEN offsetAntiguedadVeh_f=1.209;
ELSE IF AntiguedadVeh_f='08. (13, 14]' THEN offsetAntiguedadVeh_f=1.187;
ELSE IF AntiguedadVeh_f='09. (14, 16]' THEN offsetAntiguedadVeh_f=1.1;
ELSE IF AntiguedadVeh_f='11. (16, 18]' THEN offsetAntiguedadVeh_f=1.064;
ELSE IF AntiguedadVeh_f='12. (18, high]' THEN offsetAntiguedadVeh_f=1;

IF CilindradaVeh_f='01. (low, 2000]' THEN offsetCilindradaVeh_f=0.863;
ELSE IF CilindradaVeh_f='06. (2000, 2680]' THEN offsetCilindradaVeh_f=0.902;
ELSE IF CilindradaVeh_f='07. (2680, high]' THEN offsetCilindradaVeh_f=1;

IF CodTipoVeh_f='01. Turismos' THEN offsetCodTipoVeh_f=0.859;
ELSE IF CodTipoVeh_f='02. Monovolumen' THEN offsetCodTipoVeh_f=0.87;
ELSE IF CodTipoVeh_f='03. Todo Terreno' THEN offsetCodTipoVeh_f=0.909;
ELSE IF CodTipoVeh_f='04. Derivados Turismos' THEN offsetCodTipoVeh_f=0.942;
ELSE IF CodTipoVeh_f='05. Furgoneta 3,5 T.' THEN offsetCodTipoVeh_f=1;

IF EdadConductor2_f='01. (low, 20]' THEN offsetEdadConductor2_f=1.208;
ELSE IF EdadConductor2_f='02. (20, 26]' THEN offsetEdadConductor2_f=1.095;
ELSE IF EdadConductor2_f='03. (26, 28]' THEN offsetEdadConductor2_f=1.082;
ELSE IF EdadConductor2_f='04. (28, high]' THEN offsetEdadConductor2_f=0.983;
ELSE IF EdadConductor2_f='Z.Sin Segundo conductor' THEN offsetEdadConductor2_f=1;

IF EntidadCanal='02. Corredor' THEN offsetEntidadCanal=1.053;
ELSE IF EntidadCanal='03. BancaSeguros' THEN offsetEntidadCanal=1.059;
ELSE IF EntidadCanal='04. GrandesCuentas' THEN offsetEntidadCanal=0.942;
ELSE IF EntidadCanal='05. Otros' THEN offsetEntidadCanal=1.058;
ELSE IF EntidadCanal='z1. Agente' THEN offsetEntidadCanal=1;

IF EstudiosSuperioresCur_f='01. (low, 4]' THEN offsetEstudiosSuperioresCur_f=1.187;
ELSE IF EstudiosSuperioresCur_f='02. (4, 5]' THEN offsetEstudiosSuperioresCur_f=1.119;
ELSE IF EstudiosSuperioresCur_f='03. (5, 6]' THEN offsetEstudiosSuperioresCur_f=1.078;
ELSE IF EstudiosSuperioresCur_f='04. (6, 7]' THEN offsetEstudiosSuperioresCur_f=1.056;
ELSE IF EstudiosSuperioresCur_f='05. (7, high]' THEN offsetEstudiosSuperioresCur_f=1;

IF LluviaAgr_f='01. (low, 39]' THEN offsetLluviaAgr_f=0.878;
ELSE IF LluviaAgr_f='02. (39, 40]' THEN offsetLluviaAgr_f=0.986;
ELSE IF LluviaAgr_f='03. (40, high]' THEN offsetLluviaAgr_f=1;

IF TipoCombustibleVeh_f='DIESEL' THEN offsetTipoCombustibleVeh_f=1.052;
ELSE IF TipoCombustibleVeh_f='ELÉCTRICO' THEN offsetTipoCombustibleVeh_f=1.362;
ELSE IF TipoCombustibleVeh_f='GAS' THEN offsetTipoCombustibleVeh_f=0.997;
ELSE IF TipoCombustibleVeh_f='HÍBRIDO' THEN offsetTipoCombustibleVeh_f=1.027;
ELSE IF TipoCombustibleVeh_f='Z.GASOLINA' THEN offsetTipoCombustibleVeh_f=1;

IF TipoDocumento_f='02. CIF' THEN offsetTipoDocumento_f=0.885;
ELSE IF TipoDocumento_f='z01. NIF/NIE' THEN offsetTipoDocumento_f=1;

IF ValorTVeh_f='01. (low, 18700]' THEN offsetValorTVeh_f=0.89;
ELSE IF ValorTVeh_f='05. (18700, 22000]' THEN offsetValorTVeh_f=0.921;
ELSE IF ValorTVeh_f='06. (22000, 31400]' THEN offsetValorTVeh_f=0.935;
ELSE IF ValorTVeh_f='11. (31400, 38100]' THEN offsetValorTVeh_f=0.991;
ELSE IF ValorTVeh_f='12. (38100, high]' THEN offsetValorTVeh_f=1;

logoffsetAnio_f=log(offsetAnio_f);
logoffsetAntiguedadPoliza_f=log(offsetAntiguedadPoliza_f);
logoffsetAntiguedadVeh_f=log(offsetAntiguedadVeh_f);
logoffsetCilindradaVeh_f=log(offsetCilindradaVeh_f);
logoffsetCodTipoVeh_f=log(offsetCodTipoVeh_f);
logoffsetEdadConductor2_f=log(offsetEdadConductor2_f);
logoffsetEntidadCanal=log(offsetEntidadCanal);
logoffsetEstudiosSuperioresCur_f=log(offsetEstudiosSuperioresCur_f);
logoffsetLluviaAgr_f=log(offsetLluviaAgr_f);
logoffsetTipoCombustibleVeh_f=log(offsetTipoCombustibleVeh_f);
logoffsetTipoDocumento_f=log(offsetTipoDocumento_f);
logoffsetValorTVeh_f=log(offsetValorTVeh_f);


IF ProvinciaRiesgoGr_f='A Coruña-Lugo-Ourense-Pontevedra' THEN offsetProvinciaRiesgoGr_f=1.1433;
ELSE IF ProvinciaRiesgoGr_f='Alava-Guipúzcoa-La Rioja-Navarra-Vizcaya' THEN offsetProvinciaRiesgoGr_f=1.1096;
ELSE IF ProvinciaRiesgoGr_f='Albacete-Cuenca' THEN offsetProvinciaRiesgoGr_f=1.0883;
ELSE IF ProvinciaRiesgoGr_f='Alicante-Castellón-Valencia' THEN offsetProvinciaRiesgoGr_f=1.0166;
ELSE IF ProvinciaRiesgoGr_f='Almeria-Cádiz-Málaga-Murcia' THEN offsetProvinciaRiesgoGr_f=1.0946;
ELSE IF ProvinciaRiesgoGr_f='Asturias-Cantabria' THEN offsetProvinciaRiesgoGr_f=1.1062;
ELSE IF ProvinciaRiesgoGr_f='Avila-Segovia-Zamora' THEN offsetProvinciaRiesgoGr_f=1.0132;
ELSE IF ProvinciaRiesgoGr_f='Badajoz-Cáceres' THEN offsetProvinciaRiesgoGr_f=1.0044;
ELSE IF ProvinciaRiesgoGr_f='Barcelona-Girona-Lleida-Tarragona' THEN offsetProvinciaRiesgoGr_f=1.1153;
ELSE IF ProvinciaRiesgoGr_f='Burgos-León-Palencia-Salamanca-Soria-Valladolid' THEN offsetProvinciaRiesgoGr_f=1.1212;
ELSE IF ProvinciaRiesgoGr_f='Ciudad Real-Guadalaja-Toledo' THEN offsetProvinciaRiesgoGr_f=1.0009;
ELSE IF ProvinciaRiesgoGr_f='Córdoba-Granada-Huelva-Jaén-Sevilla' THEN offsetProvinciaRiesgoGr_f=1.0304;
ELSE IF ProvinciaRiesgoGr_f='Huesca-Teruel-Zaragoza' THEN offsetProvinciaRiesgoGr_f=1.0866;
ELSE IF ProvinciaRiesgoGr_f='Las Palmas de G.C.-Tenerife-Illes Baleares-Ceuta-Melilla' THEN offsetProvinciaRiesgoGr_f=1.0528;
ELSE IF ProvinciaRiesgoGr_f='z.Madrid' THEN offsetProvinciaRiesgoGr_f=1;


logoffsetProvinciaRiesgoGr_f=log(offsetProvinciaRiesgoGr_f);


Var_offset = sum(logoffsetAnio_f,logoffsetAnio_f,logoffsetAntiguedadPoliza_f,logoffsetAntiguedadVeh_f,logoffsetCilindradaVeh_f,
logoffsetCodTipoVeh_f,logoffsetEdadConductor2_f,logoffsetEntidadCanal,logoffsetEstudiosSuperioresCur_f,logoffsetLluviaAgr_f,
logoffsetTipoCombustibleVeh_f,logoffsetTipoDocumento_f,logoffsetValorTVeh_f,logoffsetProvinciaRiesgoGr_f);

	keep id &Var_Obj.  &Var_in.  &Var_Weig. Var_offset /*&Var_risk_stepwise.*/
        logoffsetAnio_f	logoffsetAntiguedadPoliza_f	logoffsetAntiguedadVeh_f	logoffsetCilindradaVeh_f	logoffsetCodTipoVeh_f	
logoffsetEdadConductor2_f	logoffsetEntidadCanal	logoffsetEstudiosSuperioresCur_f	logoffsetLluviaAgr_f	logoffsetTipoCombustibleVeh_f	
logoffsetTipoDocumento_f	logoffsetValorTVeh_f
offsetAnio_f	offsetAntiguedadPoliza_f	offsetAntiguedadVeh_f	offsetCilindradaVeh_f	offsetCodTipoVeh_f	offsetEdadConductor2_f	
offsetEntidadCanal	offsetEstudiosSuperioresCur_f	offsetLluviaAgr_f	offsetTipoCombustibleVeh_f	offsetTipoDocumento_f	offsetValorTVeh_f
logoffsetProvinciaRiesgoGr_f
;
run;

/*Proc HPGENSELECT NAMELEN=32
 Data = train_data;
	class &Var_risk_stepwise.;       
      Model &Var_Obj. = &Var_risk_stepwise. / Distribution= gamma Link=LOG ;    
	selection method=STEPWISE;
output out=SALIDA xbeta PREDICTED=Pred;
run;*/

proc genmod data=train_data namelen=100;
	class &Var_in. / /*order=freq descending*/;
	model &Var_Obj. = &Var_in. 
		/maxit=500 dist=gamma link=log offset=Var_offset  wald waldci corrb type1 type3;
		ods output parameterestimates = GLM;
	ods output modelfit = AIC;
	output out=Validation predicted= prediction;
	store models.modelo_CM_&var_1.;
quit;

/*----------------------------------------------------------------------------------------------------------------------------------------*/

/*Crear lista de vars -> &var_risk*/
proc sql noprint;
select distinct Parameter format $60. into: var_risk separated by "|"
from GLM 
where Parameter not in ('Intercept','Escala');
quit;
/*Crear lista de var_sum -> &var_sum*/
%let var_sum = Siniestros Coste Prediction;



/*----------------------------------------------------------------------------------------------------------------------------------------
Macro funcion para listar columnas de variables seleccionadas en bloques resumidos.

BD      := Tabla que contiene las columnas de categoria y columnas numerica para sumarizar.
vars    := Lista de nombres de variables de categoria para estudiar almacenado dentro de un macrovariable '%let' separado por '|'.
		   Ejemplo: %let vars = AntiguedadVeh_f|AntiguedadCarnet1_f|CZScore_f;
var_sum := lista de viariables para sumarizar almacenado dentro de un macrovariable '%let' separado por ' '.
		   Ejemplo: %let var_sum = expuestos Siniestros Prediction;
------------------------------------------------------------------------------------------------------------------------------------------*/


/*llamar a la macro funcion: %sumaria*/
%sumaria(validation, &var_risk., &var_sum.);


proc sort data=GLM; by parameter level1; run;
proc sort data=result; by parameter level1; run;
data resumen;merge GLM result; by parameter level1;run;
proc sort data=resumen; by parameter level1; run;

data resumen;
set  resumen;
format Relatividad 6.3;
	Relatividad = exp(Estimate);
run;


