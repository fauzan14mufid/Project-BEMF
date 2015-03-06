<?php


class All_Staff extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Staff');
        $this->load->model('Rapat');
        $this->load->model('Kehadiran');
        $this->load->model('Departemen');
    }

    public function daftar()
    {
        $data['Staff'] = $this->Staff->getAllStaff()->result();
        $this->load->view('__view__',$data);
    }

    public function staff()
    {
        $id = 1;
        $data['Staff'] = $this->Staff->getDataStaff($id)->row();
        //print_r($data['Staff']);
        $data['Kehadiran'] = $this->Kehadiran->getKehadiranRapat($id)->result();
        //print_r($data['Kehadiran']);
        $this->load->view('staff_report',$data);
    }
}

?>