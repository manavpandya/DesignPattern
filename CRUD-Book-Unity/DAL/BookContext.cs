using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using CRUD_Book_Unity.Models;

namespace CRUD_Book_Unity.DAL
{
    public class BookContext : DbContext
    {
        public BookContext()
            : base("name=BookStore")
        {
        }

        public DbSet<Book> Books { get; set; }
    }
}