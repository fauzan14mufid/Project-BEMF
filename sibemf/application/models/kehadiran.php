<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/2/2015
 * Time: 6:06 PM
 */

class Kehadiran extends CI_Model {
    public function setHadirRapat($data)
    {
        $this->db->insert('kehadiran',$data);
    }

    public function getKehadiranRapat($nrp)
    {
        $this->db->select('kehadiran.keterangan as KETERANGAN, rapat.Nama as NAMA_RAPAT, rapat.Tanggal as TANGGAL_RAPAT,
                            rapat.Tempat as TEMPAT_RAPAT');
        $this->db->from('kehadiran');
        $this->db->join('rapat','rapat.ID_Rapat = kehadiran.id_rapat');
        $query = $this->db->get_where(array('kehadiran.id_staff'=>$nrp));
        return $query;
    }
}

?>