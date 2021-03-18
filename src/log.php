<?php //http://rberaldo.com.br/como-gerar-logs-execucao-php/
    function logMsg($level='info',$msg,$file='log.txt') 
    {
         // variÃ¡vel que vai armazenar o nÃ­vel do log (INFO, WARNING ou ERROR)
        $levelStr="";
         // verifica o nÃ­vel do log
        switch($level) 
        {
            // nÃ­vel de informaÃ§Ã£o
            case'info':$levelStr='INFO';break;
            // nÃ­vel de aviso
            case'warning':$levelStr='WARNING';break;
            // nÃ­vel de erro
            case'error':$levelStr='ERROR';break;
         }
         // data atual
        $date=date('d/m/Y');
         // formata a mensagem do log
         // 1o: data atual
         // 2o: nÃ­vel da mensagem (INFO, WARNING ou ERROR)
         // 3o: a mensagem propriamente dita
         // 4o: uma quebra de linha
        $msg=sprintf("[%s]: %s%s%s",$date,$levelStr,$msg,PHP_EOL);
         // escreve o log no arquivo
         // Ã© necessÃ¡rio usar FILE_APPEND para que a mensagem seja escrita no final do arquivo, preservando o conteÃºdo antigo do arquivo
        file_put_contents($file,$msg,FILE_APPEND);
     }
?>