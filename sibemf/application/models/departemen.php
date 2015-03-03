<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/2/2015
 * Time: 5:48 PM
 */

class Departemen extends CI_Model {
    public function getAllDepartemen()
    {
        $query = $this->db->get('departemen');
        return $query;
    }

    public function getDetailDepartemen($id_departemen)
    {
        $query = $this->db->get_where('departemen',array('ID_Departemen'=>$id_departemen));
        return $query;
    }
}

?>