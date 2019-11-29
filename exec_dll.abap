INCLUDE ole2incl.

"Objetos
DATA: lo_mfe TYPE ole2_object.

"Variáveis
DATA: lv_return     TYPE string,
      lv_return_mod TYPE xstring.

"DLL do Windows
CREATE OBJECT lo_mfe 'DYNAMICWRAPPERX'.

CALL METHOD OF lo_mfe 'Register' "Registra a DLL e
  EXPORTING
    #1 = 'C://Biblioteca de funções/mfe.dll' "Diretório da DLL
    #2 = 'ConsultarSAT' "Função da DLL
    #3 = 'i=l'  "Parâmetro de Importação
    #4 = 'r=s'. "Parâmetro de Retorno

CALL METHOD OF lo_mfe 'ConsultarSAT' = lv_return "Executa a função
EXPORTING
  #1 = 6323.

IF sy-subrc = 0.
  "Converte o retorno
  cl_abap_conv_out_ce=>create( encoding = 'UTF-8' )->convert( EXPORTING
                                                                data = lv_return
                                                              IMPORTING
                                                                buffer = lv_return_mod ).
ENDIF.
