using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ProductosCoppel.Model;

namespace ProductosCoppel
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            var lstClases = new List<R_Clases_Result>();
            var lstFamilia = new List<R_Familias_Result>();
            var lstDepartamentos = new List<R_Departamentos_Result>();

            using (var db = new coppelEntities())
            {
                lstClases = db.R_Clases().ToList();
                lstFamilia = db.R_Familias().ToList();
                lstDepartamentos = db.R_Departamentos().ToList();

            }

            //Llenar Combobox Familia
            cbFamilia.DisplayMember = "nombre";
            cbFamilia.ValueMember = "id";
            cbFamilia.DataSource = lstFamilia;

            cbclases.DisplayMember = "nombre";
            cbclases.ValueMember = "id";
            cbclases.DataSource = lstClases;

            cbdepartamentos.DisplayMember = "nombre";
            cbdepartamentos.ValueMember = "id";
            cbdepartamentos.DataSource = lstDepartamentos;

        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            label1.Text = cbFamilia.SelectedValue.ToString();
            label2.Text = cbclases.SelectedValue.ToString();
            label3.Text = cbdepartamentos.SelectedValue.ToString();
            try
            {
                using (var db = new coppelEntities())
                {
                    db.C_Producto("pr4", "Doritos", "Sabritas", "2022", Convert.ToInt32(cbdepartamentos.SelectedValue), Convert.ToInt32(cbclases.SelectedValue),Convert.ToInt32(cbFamilia.SelectedValue), DateTime.Now, 5, 10, false, null);
                }
                MessageBox.Show("Producto Guardado correctamente");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hubo un error" + ex.InnerException.Message);
            }
        }

    }
}
