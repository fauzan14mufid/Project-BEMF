<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class mformabsen extends CI_Model
{
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	public function nama_staff()
	{
		$read_nama_Staff = $this->db->query("SELECT ID_Staff, Nama from staff order by ID_Staff ");
		return $read_nama_Staff;
	}
	public function tambah($data1){
  		$this->db->insert('rapat',$data1);//insert data di tabel mhs
  		// $this->db->insert('kehadiran',$data2);//insert data di tabel mhs
  		}
}