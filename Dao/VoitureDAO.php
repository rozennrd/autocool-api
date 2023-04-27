<?php



class VoitureDAO{
	public static function getVoituresByCategorie($lacateg){
		try{
			$sql = "select * from vehicule, categorie_vehicule, type_vehicule
			where vehicule.CODETYPE= type_vehicule.CODETYPE
			and type_vehicule.CODECATEG = categorie_vehicule.CODECATEG
			and categorie_vehicule.LIBELLECATEG = :categ" ; //and type.IDCAT = :idcateg
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->bindParam(":categ", $lacateg);

			$requetePrepa->execute();
			$reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = "";
		}
		return $reponse;
	}

	public static function getVoiture($leidvoiture){
		try{
			$sql = "select vehicule.NUMVEHICULE, station.NOMLIEU, ville.NOMVILLE, type_vehicule.LIBELLETYPE, type_vehicule.NBPLACES, type_vehicule.AUTOMATIQUE, 
			vehicule.KILOMETRAGE, vehicule.NIVEAUESSENCE, categorie_vehicule.LIBELLECATEG
			from vehicule, type_vehicule, station, ville, categorie_vehicule
			where type_vehicule.CODETYPE = vehicule.CODETYPE
            and type_vehicule.CODECATEG = categorie_vehicule.CODECATEG
			and ville.CODEVILLE = station.CODEVILLE
			and station.CODELIEU = vehicule.CODELIEU
			and station.CODEVILLE = vehicule.CODEVILLE
			and NUMVEHICULE = :idVoiture";
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->bindParam(":idVoiture", $leidvoiture);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetch(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = "not found";
		}
		return $reponse;
	}

	public static function ajouterVoiture($idStation, $idType, $libelle, $km, $niveauEssence){

			$sql =  "INSERT INTO `voiture` ( CODELIEU, CODETYPE, NUMVEHICULE, KILOMETRAGE, NIVEAUESSENCE)
				VALUES (:idStation, :idType, :libelle, :km, :niveauEssence)";
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->bindParam(":idStation", $idStation);
			$requetePrepa->bindParam(":idType", $idType);
			$requetePrepa->bindParam(":libelle", $libelle);
			$requetePrepa->bindParam(":km", $km);
			$requetePrepa->bindParam(":niveauEssence", $niveauEssence);
			
			$requetePrepa->execute();



}











}




 ?>
