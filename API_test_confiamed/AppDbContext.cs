using API_test_confiamed.Models;
using Microsoft.EntityFrameworkCore;

namespace API_test_confiamed
{

    public class AppDbContext : DbContext
    {
        public DbSet<Formularios> Formularios { get; set; }
        public DbSet<Campos> Campos { get; set; }

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Formularios>()
            .HasMany(f => f.Campo)
            .WithOne(i => i.Formulario)
            .HasForeignKey(i => i.IdFormulario); 
        }
    }
}
