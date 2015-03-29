<?php


class All_Staff extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->library('session'); // barangkali perlu, hapus kalo bikin error
        $this->load->model('Staff');
        $this->load->model('Rapat');
        $this->load->model('Kehadiran');
        $this->load->model('Departemen');
        $this->load->model('Penilaian');
    }

    public function daftar()
    {
        $data['Staff'] = $this->Staff->getAllStaff()->result();
        $data['Departemen'] = $this->Departemen->getAllDepartemen()->result();
        $this->load->view('daftar_staff',$data);
    }

    public function staff($id)
    {
        $data['Staff'] = $this->Staff->getDataStaff($id)->row();
        $data['Kehadiran'] = $this->Kehadiran->getKehadiranRapat($id)->result();
        $this->load->view('staff_report',$data);
    }

    public function monthly($bulan)
    {
        for($i=1;$i<7;$i++){
            $data['dpt'.$i] =  $this->Penilaian->StaffOTMonth($bulan,$i);
        }
        //print_r($data);
        $this->load->view('staffOTH',$data);
    }
}

?>