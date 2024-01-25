using QL_Vaccine.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    public class ChucVu_DAO
    {
        private static ChucVu_DAO instance;

        public static ChucVu_DAO Instance 
        {
            get { if (instance == null) instance = new ChucVu_DAO(); return instance; }
            private set { instance = value; }
        }

        private ChucVu_DAO() { }

        public List<ChucVu> GetListChucVu()
        {
            List<ChucVu> listChucVu = new List<ChucVu>();
            string query = "SELECT * FROM ChucVu";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach(DataRow item in data.Rows)
            {
                ChucVu chucvu = new ChucVu(item);
                listChucVu.Add(chucvu);
            }
            return listChucVu;
        }

        public ChucVu GetTenChucVuByMaCV(string maCV)
        {
            ChucVu chucVu = null;

            string query = "select * from ChucVu where MaCV='" + maCV + "'";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                chucVu = new ChucVu(item);
                return chucVu;
            }

            return chucVu;
        }

    }
}
