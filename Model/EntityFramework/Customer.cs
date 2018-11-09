//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Model.EntityFramework
{
    using System;
    using System.Collections.Generic;
    
    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            this.DanhGiaCuaCustomers = new HashSet<DanhGiaCuaCustomer>();
            this.DanhGiaCuaMerchants = new HashSet<DanhGiaCuaMerchant>();
            this.DonHangs = new HashSet<DonHang>();
            this.LichSuCus = new HashSet<LichSuCu>();
        }
    
        public int CustomerID { get; set; }
        public string Email { get; set; }
        public string HoTen { get; set; }
        public string DiaChi { get; set; }
        public string SoDienThoai { get; set; }
        public string MatKhauMaHoa { get; set; }
        public int GioiTinhID { get; set; }
        public Nullable<int> DanhGia { get; set; }
        public bool TrangThai { get; set; }
    
        public virtual GioiTinh GioiTinh { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhGiaCuaCustomer> DanhGiaCuaCustomers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhGiaCuaMerchant> DanhGiaCuaMerchants { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DonHang> DonHangs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LichSuCu> LichSuCus { get; set; }
    }
}