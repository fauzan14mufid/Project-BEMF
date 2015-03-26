<?php


class isi_Absen extends CI_Controller {
    function __construct()
    {
        parent::__construct();
        $this->load->model('Staff');
        $this->load->model('Departemen');
        $this->load->model('Kehadiran');
        $this->load->model('Rapat');
        $this->load->helper('form');
        $this->load->helper('url');
        $this->load->model('Penilaian_Staff');
        $this->load->model('Penilaian');
    }
    public function home()
    {
        session_start();
        $this->load->view('submenu');
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
        $this->load->view('rapat_form',$data);
    }


    public function ambil_data_form()
    {
       session_start();
        if(!isset($_SESSION['departemen'])){
            redirect('home/login');
        } 
        $namarapat  = $this->input->post('nama_rapat'); //input nim
        $tanggalrapat   = $this->input->post('tanggal_rapat'); //input nama
        $tempatrapat        = $this->input->post('tempat_rapat'); //input alamat
        $jumlah = $this->input->post('jumlah');
        $data_rapat = array (
            'Nama'  => $namarapat, 
            'Tanggal'  => $tanggalrapat,
            'Tempat' => $tempatrapat,
            'ID_Departemen' => $_SESSION['departemen']
        );
        $this->Rapat->setDataRapat($data_rapat); 
        $id_rapat = $this->Rapat->getIDRapat()->ID_Rapat;
        for($i=0 ; $i<$jumlah ; $i++){
            $absen[$i]= $this->input->post('absen'.$i);
            $staff[$i]= $this->input->post('id_staff'.$i);
            $data_kehadiran[$i] = array (
                'id_rapat' => $id_rapat,
                'id_staff'=> $staff[$i],
                'keterangan' => $absen[$i]
            );

           $this->Kehadiran->setKehadiran($data_kehadiran[$i]);
        }

        
    }
     public function nilai()
    {
        session_start();
        if(!isset($_SESSION['departemen'])){
            redirect('home/login');
        }   
        //echo $_SESSION['departemen'];
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
            $leadership[$i]= $this->input->post('nilai'.$i);
            $teamwork[$i]= $this->input->post('nilai1'.$i);
            $problem_solving[$i] = $this->input->post('nilai2'.$i);
            $loyalitas[$i] = $this->input->post('nilai3'.$i);
            $kinerja[$i] = $this->input->post('nilai4'.$i);
            $attitude[$i] = $this->input->post('nilai5'.$i);
            $total[$i] = ($leadership[$i]+$teamwork[$i]+$problem_solving[$i]+$loyalitas[$i]+$kinerja[$i]+ $attitude[$i])/6;
            $data_nilai[$i] = array (
            
                'Leadership' => $leadership[$i],
                'Teamwork'=>  $teamwork[$i],
                'Problem_Solving' => $problem_solving[$i],
                'Loyalitas' => $loyalitas[$i],
                'Kinerja' => $kinerja[$i] ,
                'Attitude' => $attitude[$i],
                'Total_Nilai' => $total[$i]
            );
            //print_r ($data_nilai[$i]);
            $this->Penilaian->setNilai($data_nilai[$i]);
        }

        
    }
}

?>