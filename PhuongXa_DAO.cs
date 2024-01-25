using QL_Vaccine.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    class PhuongXa_DAO
    {
        private static PhuongXa_DAO instance;
        public static PhuongXa_DAO Instance
        {
            get { if (instance == null) instance = new PhuongXa_DAO(); return PhuongXa_DAO.instance; }
            private set { PhuongXa_DAO.instance = value; }
        }
        private PhuongXa_DAO() { }

        public List<PhuongXa> GetPXByMaQH(string MaQH)
        {
            List<PhuongXa> list = new List<PhuongXa>();

            string query = "Select * from PhuongXa where MaQH ='" + MaQH + "'";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                PhuongXa phuongXa = new PhuongXa(item);
                list.Add(phuongXa);
            }

            return list;
        }

        public PhuongXa GetPhuongXaByMaPX(string MaPX)
        {
            PhuongXa phuongXa = null;

            string query = "select * from PhuongXa where MaPX = " + MaPX;

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                phuongXa = new PhuongXa(item);
                return phuongXa;
            }

            return phuongXa;
        }
    }
}
