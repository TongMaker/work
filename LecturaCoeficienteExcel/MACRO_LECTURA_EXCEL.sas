/*
Macro %leer_tarifa(
1. Nombre de hoja excel para tarificacion, 
2. Nombre de la variable como tabla que necesita trasponer 
   (para a�adir directamente a la BBDD sin que se transforme como formato sas, por ejemplo: Prima, Tasa, ...),
3. Ruta de fichero de excel donde situe
)
*/


rsubmit;
*%let ruta =/HOGAR_TEC/BRM_RTDM_PRD/PYMES/PYME3067000V002_PYME21/Tarificar PYME3067000V002_PYME21/Tarifa_Pyme.xlsx;

%macro leer_tarifa(nom_Cobertura,VarParaTransp, ruta);

/*Importar toda la hoja en la columna 1 y columna 4*/
	proc import datafile="&ruta."
	    out=work.file(keep = A D)
	    dbms=xlsx replace;
	    sheet="&nom_Cobertura.";
	    getnames=no;
	    datarow=1;
	run;
	/*Crear una tabla total que muestra cada tabla de variables desde fila A hasta fila B*/
	data datafilas;
	    set file;
		num= _n_;
		if not missing(D);
		if lag(num) ne num-1  then nn=1;
		if nn=1;	
	run;
	/*Almacenar los nombres de variables (Columna A) en una cadena*/
	proc sql noprint;
	    select distinct A, monotonic() as ord
	    into : colnames separated by ",", :ordlist separated by ","
	    from datafilas order by ord;
	quit;
	/*Almacenar las los numeros de filas que inicia y que acaba las tablas*/
	proc sql noprint;
	    select distinct num
	    into: filas separated by ","
	    from datafilas;
	 quit;
	/*Numero de variables (longitud de la cadena)*/
	%let longitud = %sysfunc(countw("&filas.", ','));
	/*despues de la ultima variable a�adimos 1000 filas mas para tener suficiente espacio*/
	%let filasf=&filas,%eval(%scan("&filas",&longitud.,",")+1000);
	/*Bucle para ejecutar y crear tablas para todas las variables y que obtiene los campos de format: 
	 (START END FMTNAME TYPE LABEL HLO)*/
	%do i = 1 %to &longitud.;
	    /***Rango del excel de cada tabla i*/
		%let tabla_fila = &nom_Cobertura.$B%scan("&filasf",&i,","):D%eval(%scan("&filasf",%eval(&i+1),",")-1) ;
		%let tabla_nom = %scan("&colnames",&i,",");
	    /***seleccionar la tabla de variable i y eliminar las filas de blanco*/
		proc import datafile="&ruta."
	 		out=&nom_Cobertura._&tabla_nom. (where=(not missing(B) and not missing(D)))
	 		dbms=xlsx
	 		replace;
	 		range="&tabla_fila";
	 		getnames=no;
		run;
	    /***Crear la tabla de variable i con los campos de sas format*/
		data &nom_Cobertura._&tabla_nom. (KEEP = START END FMTNAME TYPE LABEL HLO) ;
			/***END OF FILE, cuando se pone 'output' esto permite a�adir otra linea(L) despues de la ultima fila creada (sino a�ade (L) en cada linea)*/	
			set &nom_Cobertura._&tabla_nom. END=EOF; 
			retain START END FMTNAME TYPE LABEL HLO;
			START = B;
			if missing(C) then
				END = START;
			else 
				END = C;
			TYPE = VTYPE(B);
			FMTNAME = "&nom_Cobertura._&tabla_nom.";
			LABEL = D;
			HLO = "";
			output;
	        /***valor de asignaci�n en otros casos (final de la tabla)*/
			IF EOF;
			IF TYPE='N' THEN DO; START=.;END=.; END; ELSE DO; START=''; END=''; END;
	            HLO='O';
	            label=0;
			output;
		run;
		proc format library=WORK cntlin=&nom_Cobertura._&tabla_nom.; run;
	%end;
	/*Las primas tiene otro formato*/
	%if %sysfunc(exist(work.&nom_Cobertura._&VarParaTransp.))  %then
		%do;
	    	PROC TRANSPOSE DATA=&nom_Cobertura._&VarParaTransp. (WHERE=(HLO='' )) OUT=&nom_Cobertura._&VarParaTransp. (DROP =_NAME_);
	    		ID START;
	    		VAR LABEL;
	  		RUN;
		%end;

		proc datasets nolist lib=work; delete Datafilas File; quit;
%mend;






proc datasets nolist lib=work kill; 
*delete exp: sum:;    /* all data sets that begin with "exp, sum" */
quit;


*ELEMPLO;
*%leer_tarifa(PRUEBA);
endrsubmit;
