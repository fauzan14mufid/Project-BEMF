<?php

class All_Nilai extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Staff');
        $this->load->model('Departemen');
        $this->load->model('Penilaian_Staff');
        $this->load->model('Penilaian');
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
        $bulan = $this->input->post('bulan');
        for($i=0 ; $i<$jumlah ; $i++){
            $leadership[$i]= $this->input->post('nilai'.$i);
            $teamwork[$i]= $this->input->post('nilai1'.$i);
            $problem_solving[$i] = $this->input->post('nilai2'.$i);
            $loyalitas[$i] = $this->input->post('nilai3'.$i);
            $kinerja[$i] = $this->input->post('nilai4'.$i);
            $attitude[$i] = $this->input->post('nilai5'.$i);
            $id_staff[$i] = $this->input->post('nilai6'.$i);
            $total[$i] = ($leadership[$i]+$teamwork[$i]+$problem_solving[$i]+$loyalitas[$i]+$kinerja[$i]+ $attitude[$i])/6;
            $data_nilai[$i] = array (
            
                'Leadership' => $leadership[$i],
                'Teamwork'=>  $teamwork[$i],
                'Problem_Solving' => $problem_solving[$i],
                'Loyalitas' => $loyalitas[$i],
                'Kinerja' => $kinerja[$i] ,
                'Attitude' => $attitude[$i],
                'Total_Nilai' => $total[$i],
                'ID_Staff' => $id_staff[$i],
                'Bulan' => $bulan,
                'ID_Departemen' => $_SESSION['departemen']
            );
            //print_r ($data_nilai[$i]);
            $this->Penilaian->setNilai($data_nilai[$i]);
        }
        redirect("all_staff/monthly/$bulan");

        
    }
}   

//    public function all()
 //   {

   // }

?>