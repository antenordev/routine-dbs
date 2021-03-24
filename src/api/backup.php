<?php require_once"log.php"; include_once"config.php";
	$sql="SELECT * FROM aluno";
	$result=$con->query($sql);
 	if ($result) 
 	{   
 		$caminho="_save/";
		$arquivo="backup_".date('d'.'-'.'m'.'-'.'Y').'_'.mt_rand(1000,9999);
		$save=$caminho.$arquivo;
		//mkdir(__DIR__.'/_save//', 0777, true);
		if ($result->num_rows>0) 
		{
			$myfile=fopen("$save.sql",'w');
			while ($row=$result->fetch_assoc()) 
			{
				$rowToString=implode("','",$row);
				$writeToFile="INSERT INTO aluno VALUES('$rowToString');".PHP_EOL;
				fwrite($myfile,$writeToFile);

			}
		//echo"<script>alert('Backup: ".$arquivo."')</script><script>window.location.href='index.php'</script>";
		}
	}
	logMsg('INFO','Backup: '.$arquivo,'log_backup');
?>