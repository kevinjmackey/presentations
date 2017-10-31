using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CobolGenerator
{
    public partial class MyFormControl : Form
    {
        public delegate void UpdateOdometer();
        public UpdateOdometer myDelegate;
        private Thread myThread;
        public MyFormControl()
        {
            InitializeComponent();
            myDelegate = new UpdateOdometer(UpdateOdomoterMethod);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            lblOdometer.Visible = true;
            myThread = new Thread(new ThreadStart(ThreadFunction));
            myThread.Start();
        }
        public void UpdateOdomoterMethod()
        {
            for (int i = 1; i < 7000; i++)
            {
                lblOdometer.Text = i.ToString("N0");
                lblOdometer.Update();
                Thread.Sleep(3);
            }
        }
        private void ThreadFunction()
        {
            MyThreadClass myThreadClassObject = new MyThreadClass(this);
            myThreadClassObject.Run();
        }
    }
    public class MyThreadClass
    {
        MyFormControl myFormControl1;
        public MyThreadClass(MyFormControl myForm)
        {
            myFormControl1 = myForm;
        }

        public void Run()
        {
            // Execute the specified delegate on the thread that owns
            // 'myFormControl1' control's underlying window handle.
            myFormControl1.Invoke(myFormControl1.myDelegate);
        }
    }
}
