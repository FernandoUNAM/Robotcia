# Proyecto Final Robótica: Robot ABB1100 580 4 

## Descripción de Programas

### Cinematica

* ABB1100_CinematicaDirecta.m es la función que dados unos puntos cartesianos **x,y,z** obtiene el vector solución **q** de variables articulares
* ABB1100_CinematicaInversa.m es la función que dados los valores de las articulaciones **q** obtiene la posición en variables cartesianas del efector final
* ABB1100_CinematicaVariables.mat contiene las ecuaciones de Cinematica Directa, el Jacobiano J77, su inverso J77i y el determinante, así como sus simplificaciones

### Control

* ABB1100_Control_ParCalculado.m contiene la función que dadas las posiciones y velocidades tanto actuales como deseadas, así como las aceleraciones deseadas obtiene la ley de control TAU que haga  al robot seguir dicha trayectoria
* ABB1100_Control_PD.m Contiene la función de control de Posición por el que se especifica la posición deseada y se obtiene la ley de Control TAU
* ABB1100_Control_PDG.m Contriene la misma función anterior más la compensación por el torque gravitacional

### Dinamica

ABB1100_DinamicaDirecta.m fue la primer versión de la dinamica directa del robot, aunque con las matrices M,G,C sin ningún paso de simplificado
ABB1100_DinamicaDirecta (1,2,3,4,5,6) son las diferentes versiones de funciones con los diferentes cambios en parametros como masas, inercias, signos para resolver problemas de simulación

ABB1100_DinamicaDirecta_Sim.slx es la primer simulación en simulink con la función de DD implementada. Es completa y Robusta. Utiliza la 5ta versión de la función DD.m y su comportamiento es aproximadamente lo esperado. 
ABB1100_DinamicaDirecta_Sim.xlx

ABB1100_Simulacion_Dinamica_5F_-45.gif es la simulación de 10 segundos del robot con una condición inicial de su articulación q2 a -pi/4 con una fricción de 5N
ABB1100_Simulación_Dinamica_5F_0V.gif es una simulación de 5 segundos del robot con una condición inicial de 0 (vertical superior) dejandose caer y llegando al punto de equilibrio inferior, con una Fricción de 5N
ABB1100_Simulación_Dinamica_1F_0V.gif es una simulación de 10 segundos con una fricción de 1N
ABB1100_Simulación_Dinámica_01_P0.gif es una simulación con posición inicial del robot (todas las variables articulares igual a 0) con una fricción de 0.1N en un intervalo de 10 Segundos 




## Consideraciones del Proyecto

### Versiones Modelado Dinamico, Función Dinámica Directa y matrices M,G,C. 

* ModeladoDinamico_v1 y sus correspondientes matrices M,G,C consideran valores erroneos de masas
* ModeladoDinamico_v2 y sus correspondientes matrices M,G,C consideran los valores correctos de las masas así como solo la diagonal principal de Inercias
* ModeladoDinamico_v3 y sus correspondientes matrices M,G,C consideran toda la matriz 3x3 de inercias proporcionado por el CAD
* ModeladoDinamico_v4 y sus correspondientes matrices M,G,C es una versión que prueba resolver el problema con la articulación *q5* cambiando el signo de la delta de distancia desde el sistema de referencia a el centro de masa. 

