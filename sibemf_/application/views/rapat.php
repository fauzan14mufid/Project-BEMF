<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/2/2015
 * Time: 6:11 PM
 */

class Staff extends CI_Model {
    public function getAllRapat()
    {
        $query = $this->db->get('Rapat');
        return $query;
    }

    public function getallKehadiran($Data)
    {
        
        
        $query = $this->db->get('Kehadiran');
        $sql = "SELECT id_rapat, (SELECT Count(keterangan) FROM kehadiran WHERE keterangan=1) as jumlah FROM rapat WHERE ID_Departemen=$Data";
        $query = $this->db->query($sql, array( $like1, $like2));
        return $query;
    }
    

    public function getRapatByDeptID($id_dp)
    {
        $query = $this->db->get_where('Rapat',array('ID_Departemen'=>$id_dp));
        return $query;
    }
}

?>