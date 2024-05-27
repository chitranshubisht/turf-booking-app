// app/javascript/components/FacilityList.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';

const FacilityList = () => {
  const [facilities, setFacilities] = useState([]);
  const [filters, setFilters] = useState({ name: '', location: '' });

  useEffect(() => {
    fetchFacilities();
  }, [filters]);

  const fetchFacilities = async () => {
    const response = await axios.get('/facilities', { params: filters });
    setFacilities(response.data);
  };

  const handleFilterChange = (e) => {
    setFilters({ ...filters, [e.target.name]: e.target.value });
  };

  return (
    <div>
      <input
        type="text"
        name="name"
        placeholder="Search by name"
        onChange={handleFilterChange}
      />
      <input
        type="text"
        name="location"
        placeholder="Search by location"
        onChange={handleFilterChange}
      />
      <ul>
        {facilities.map(facility => (
          <li key={facility.id}>
            {facility.name} - {facility.location}
            <a href={`/facilities/${facility.id}`}>View Details</a>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default FacilityList;
