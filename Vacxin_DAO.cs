using QL_Vaccine.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    public class Vac_xin_DAO
    {
        private static Vac_xin_DAO instance;

        public static Vac_xin_DAO Instance
        {
            get { if (instance == null) instance = new Vac_xin_DAO(); return instance; }
            private set { instance = value; }
        }

        private Vac_xin_DAO() { }

        public DataTable GetAllVacxin()
        {
            string query = "EXEC [dbo].[GetDanhMucVCList]";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public DataTable FindDanhMucByMaVX(string MaVX)
        {
            string query = "Exec [dbo].[FindDanhMucVCByMaVacxin] @MaVacxin = '" + MaVX + "'";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public string CountSoLuongVacXin()
        {
            string query = "SELECT COUNT(MaVacxin) From DanhMuc_Vaccine";
            return DataProvider.Instance.ExecuteScalar(query).ToString();
        }

        public bool InsertVacXin(string tenChung, string tenThuongMai, int maBenh, float donGia , string moTa, string thanhPhan, string tacDungPhu)
        {
            string query = "EXEC [dbo].[InsertDanhMucVacXin] @MaBenh = "+maBenh+",@TenChung = '"+tenChung+"',@TenThuongMai ='"+tenThuongMai+"',@DonGia = "+donGia+",@MoTa =N'"+moTa+"',@ThanhPhan=N'"+thanhPhan+"',@TacDungPhu =N'"+tacDungPhu+"'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public List<Vacxin> GetVacxinByMaVC(string MaVacxin)
        {
            List<Vacxin> list = new List<Vacxin>();
            string query = "Select * from DanhMuc_Vaccine where MaVacxin = '" + MaVacxin + "'";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                Vacxin Vacxin = new Vacxin(item);
                list.Add(Vacxin);
            }
            return list;
        }

        public bool UpdateVacXin(string maVacxin, string tenChung, string tenThuongMai, int maBenh, float donGia, string moTa, string thanhPhan, string tacDungPhu)
        {
            string query = "EXEC [dbo].[UpdateDanhMucVacXin] @MaVacxin = '"+maVacxin+"', @MaBenh = " + maBenh + ",@TenChung = '" + tenChung + "',@TenThuongMai ='" + tenThuongMai + "',@DonGia = " + donGia + ",@MoTa =N'" + moTa + "',@ThanhPhan=N'" + thanhPhan + "',@TacDungPhu =N'" + tacDungPhu + "'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public List<Vacxin> GetListVacxin()
        {
            List<Vacxin> listVacxin = new List<Vacxin>();
            string query = "SELECT * FROM DanhMuc_Vaccine";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                Vacxin vacxin = new Vacxin(item);
                listVacxin.Add(vacxin);
            }
            return listVacxin;
        }

        public Vacxin Get_VacxinByMaVC(string MaVacxin)
        {
            Vacxin vacxin = null;

            string query = "Select* from DanhMuc_Vaccine where MaVacxin = '" + MaVacxin + "'";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                vacxin = new Vacxin(item);
                return vacxin;
            }

            return vacxin;
        }
    }
}
