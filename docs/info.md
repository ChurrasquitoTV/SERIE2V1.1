Cómo funciona?
Este proyecto implementa una cerradura electrónica basada en una máquina de estados finitos (FSM) combinada (Moore + Mealy). El debe ingresar un PIN de 4 dígitos de usuario (1-3-9-2) utilizando interruptores (digit[3:0]) y confirmar cada número con un botón (enter). Si la secuencia es correcta, se enciende un LED (abierto) indicando que la cerradura está abierta. Si se ingresa un número incorrecto, el sistema entra en estado de error y debe reiniciarse con el botón de reinicio.

Cómo realizar la prueba

Usa los 4 interruptores para poner el primer dígito (dígito[3:0]).
Presione el botón enter para confirmar el dígito.
Repite los pasos con los dígitos: 1, 3, 9, 2.
Si la secuencia es correcta, se encenderá el LED de salida (abierto).
Si te equivocas, presiona el botón reset y vuelve a intentar.

Hardware externo

BASYS33
