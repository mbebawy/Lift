using Lift.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lift.Core.Adapters
{
    public static class AddressAdapter
    {
        public static Address toServiceAddress(DataAccess.UserAddress_GET_Result a)
        {
            Address address = null;
            if (a != null && a.Id != null)
            {
                address = new Address()
                {
                    Id = (Guid)a.Id,
                    Address1 = a.Address1,
                    Address2 = a.Address2,
                    City = a.City,
                    State = a.State,
                    Zip = a.Zip,
                    Country = a.Country
                };
            }
            return address;
        }
    }
}
