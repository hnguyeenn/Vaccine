using QL_Vaccine.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    public class Benh_DAO
    {
        private static Benh_DAO instance;

        public static Benh_DAO Instance
        {
            get { if (instance == null) instance = new Benh_DAO(); return instance; }
            private set { instance = value; }
        }

        private Benh_DAO() { }

        public List<Benh> GetListBenh()
        {
            List<Benh> listBenh = new List<Benh>();
            string query = "SELECT * FROM Loai_Benh";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                Benh Benh = new Benh(item);
                listBenh.Add(Benh);
            }
            return listBenh;
        }

        public Benh GetTenBenhByMaBenh(string maBenh)
        {
            Benh Benh = null;

            string query = "Select * from Loai_Benh where MaBenh='" + maBenh + "'";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Benh = new Benh(item);
                return Benh;
            }

            return Benh;
        }
    }
}
