var teclaEsquerda = jQuery.Event("keypress");
teclaEsquerda.ctrlKey = false;
teclaEsquerda.which = 37; //Código da tecla - seta esquerda

$("botao").trigger(teclaEsquerda);