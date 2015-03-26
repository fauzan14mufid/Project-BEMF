<?php

class reportrapatbph extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        
        $this->load->model('Rapat');
        $this->load->model('Kehadiran');
    }
   
    public function isi()
    {
        session_start();
        if(!isset($_SESSION['departemen'])){
            redirect('home/login');
        }   
        //echo $_SESSION['departemen'];
        $id_departemen = $_SESSION['departemen'];
        $data['Rapat'] = $this->Rapat->getallkehadiran($id_departemen)->result();
        // __view__ : tinggal ubah nama viewnya aja
        $this->load->view('reportrapatbph',$data);
        $this->load->model('rapat',$id_departemen);
    }

    

        
    }


?>