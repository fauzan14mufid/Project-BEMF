<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/15/2015
 * Time: 8:26 PM
 */
class All_Rapat extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->library('session'); // barangkali perlu, hapus kalo bikin error
        $this->load->model('Departemen');
        $this->load->model('Rapat');
        $this->load->model('Staff');
        $this->load->model('Kehadiran');
    }
    public function daftar()
    {
        $id_dp = $_SESSION['departemen'];
        $data['Rapat'] = $this->Kehadiran->getDetailAbsensiRapat($id_dp);
        $this->load->view('reportrapatbph',$data);
    }
}
?>