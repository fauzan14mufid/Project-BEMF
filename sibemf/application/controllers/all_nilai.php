<?php

class All_Nilai extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Staff');
        $this->load->model('Penilaian_Staff');
        $this->load->model('Penilaian');
    }

    public function isi()
    {
        session_start();
        if(!isset($_SESSION['departemen'])){
            redirect('home/login');
        }   
        echo $_SESSION['departemen'];
        $id_departemen = $_SESSION['departemen'];
        $data['Staff'] = $this->Staff->getStaffByDeptID($id_departemen)->result();
        // __view__ : tinggal ubah nama viewnya aja
        $this->load->view('formnilai',$data);
    }

    public function sendpenilaian()
    {
        session_start();
        if(!isset($_SESSION['departemen'])){
            redirect('home/login');
        } 
        $jumlah = $this->input->post('jumlah');
        for($i=0 ; $i<$jumlah ; $i++){
            $nilai[$i]= $this->input->post('nilai'.$i);
            $staff[$i]= $this->input->post('id_staff'.$i);
            $data_nilai[$i] = array (
                'id_rapat' => $id_rapat,
                'id_staff'=> $staff[$i],
                'keterangan' => $nilai[$i]
            );

           $this->penilaian->setNilai($data_nilai[$i]);
        }

        
    }
}

//    public function all()
 //   {

   // }

?>