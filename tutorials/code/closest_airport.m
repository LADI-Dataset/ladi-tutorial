% location of cambridge,ma
latimage = 42.373615;
longimage = -71.109734;

% make into array
longairport = table2array(Airports(:,1));
latairport = table2array(Airports(:,2));
uuidairport = table2array(Airports(:,4));
nameairport = table2array(Airports(:,6));

% zero variables
distance_degrees = zeros(height(Airports),1);
distance_meters = zeros(height(Airports),1);

% iterate over all airports
for i = 1: height(Airports)
    distance_degrees(i) = sqrt((abs(latimage - latairport(i)))^2 + (abs(longimage - longairport(i)))^2);
    distance_meters(i) = distance_degrees(i) * 111194.926644559;
end

airport_id = table2array(Airports(:,3));
% airport_uuid = table2array(Airports(:,4));
% airport_name = table2array(Airports(:,6));

% organize information
airportinfo = zeros(height(Airports),2);
for i = 1:height(Airports)
    airportinfo(i,1) = distance_meters(i);
    airportinfo(i,2) = airport_id(i);
end

%     airportinfo(i,2) = airport_uuid(i);
%     airportinfo(i,3) = airport_name(i);

% sort distances
airportsort = sortrows(airportinfo,1);

% Output a N X 4 column of UUID, image latitude, image longitude, 
% distance to nearest airport, UUID of nearest airport

closestairportlong = longairport(airportsort(1,2));    
x1 = 'The longitude of the closest airport is ';
disp(x1)
closestairportlong
x2 = 'The latitude of the closest airport is ';
disp(x2)
latairport(airportsort(1,2))
x3 = 'The distance in meters from the closest airport is ';
disp(x3)
airportsort(1,1)
x4 = ['The UUID of the closest airport is ', uuidairport(airportsort(1,2))];
disp(x4)
x5 = ['The name of the closest airport is ', nameairport(airportsort(1,2))];
disp(x5)

    
    

