// app/javascript/components/FacilityDetails.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';

const FacilityDetails = ({ match }) => {
  const [facility, setFacility] = useState(null);

  useEffect(() => {
    fetchFacility();
  }, []);

  const fetchFacility = async () => {
    const response = await axios.get(`/facilities/${match.params.id}`);
    setFacility(response.data);
  };

  if (!facility) return <div>Loading...</div>;

  return (
    <div>
      <h1>{facility.name}</h1>
      <p>{facility.description}</p>
      <p>{facility.location}</p>
      {facility.images && facility.images.split(',').map((url, idx) => (
        <img key={idx} src={url} alt={`Facility image ${idx + 1}`} />
      ))}
      {/* Add booking form or booking slots here */}
    </div>
  );
};

export default FacilityDetails;
