<?php

class StationsDAO{
	public static function getStationsAndTowns(){
		try{
			$sql = "SELECT station.CODEVILLE, station.CODELIEU, NOMLIEU, NOMVILLE FROM station INNER JOIN ville ON station.CODEVILLE = ville.CODEVILLE";
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = "";
		}
		return $reponse;
	}


}