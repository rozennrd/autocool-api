<?php

class TypeVehiculeDAO{
	public static function getTypeVehicule(){
		try{
			$sql = "select * from type_vehicule";
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = "";
		}
		return $reponse;
	}


}