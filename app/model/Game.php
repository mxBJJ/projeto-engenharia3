<?php



class Game{



    public static function selecionarTodos(){

        $con = Connection::getConn();



        $sql = "SELECT * FROM games ORDER BY id DESC";

        $sql = $con->prepare($sql);

        $sql->execute();

        $resultado = array();

        

        while($row = $sql->fetchObject('game')){

            $resultado[] = $row;

        }



        if(!$resultado){

            throw new Exception("Não foi encontrado nenhum registro");

        }

        return $resultado;

    }



    public static function selecionaPorId($idPost){

        $con = Connection::getConn();

        

        $sql = "SELECT * FROM game WHERE id = :id";

        $sql = $con->prepare($sql);

        $sql->bindValue(':id', $idPost, PDO::PARAM_INT);

        $sql->execute();



        $resultado = $sql->fetchObject("Game");

        return $resultado;

    }



    public static function insert($dadosPost){

        
        $con = Connection::getConn();

        $sql = "INSERT INTO games (nome, preco, categoria_id, plataforma_id) VALUES (:nome, :preco, :categoria_id, :plataforma_id)";

        $sql = $con->prepare($sql);

        $sql->bindValue(':nome', $dadosPost["nome"]);

        $sql->bindValue(':preco', $dadosPost["preco"]);

        $sql->bindValue(':categoria_id', $dadosPost["categoria_id"]);

        $sql->bindValue(':plataforma_id', $dadosPost["plataforma_id"]);

        $res = $sql->execute();



        if($res == 0){

            throw new Exception("Falha ao inserir no banco");

            return false;

        }



        return true;

    }



    public static function update($params){



        $con = Connection::getConn();

        $sql = "UPDATE games SET nome = :nome, preco = :preco, preco = :preco, categoria_id = :categoria_id, plataforma_id = :plataforma_id  WHERE id = :id";

        $sql->bindValue(':nome', $params["nome"]);

        $sql->bindValue(':preco', $params["preco"]);

        $sql->bindValue(':categoria_id', $params["categoria_id"]);

        $sql->bindValue(':plataforma_id', $params["plataforma_id"]);

        $sql->bindValue(':id', $dadosPost["id"]);

        $sql = $con->prepare($sql);

        $res = $sql->execute();



        if($res == 0){

            throw new Exception("Falha ao alterar no banco");

            return false;

        }

        

        return true;

    }



}



?>