[#ftl]
[#if package?? && package != ""]package ${package}.[/#if]da.jdbc;

import [#if package?? && package != ""]${package}.[/#if]da.${className}Dao;
import [#if package?? && package != ""]${package}.[/#if]da.mapper.${className}Mapper;
import [#if package?? && package != ""]${package}.[/#if]domain.${className};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
  *
  */
@Repository("${classRefName}Dao")
public class ${className}DaoImpl extends BaseDaoImpl implements ${className}Dao {

	protected final NamedParameterJdbcTemplate jdbc;
	protected final RowMapper<${className}> mapper;
	protected final ResultSetExtractor<${className}> objectExtractor;
	protected final ResultSetExtractor<List<${className}>> listExtractor;

	@Autowired
	public ${className}DaoImpl(
			@Qualifier("${jdbcName}") NamedParameterJdbcTemplate jdbc,
			@Qualifier("${classRefName}Mapper") ${className}Mapper mapper
	) {
		this.jdbc = jdbc;
		this.mapper = mapper;
		this.objectExtractor = mapper.EXTRACTOR;
		this.listExtractor = mapper.LIST_EXTRACTOR;
	}

	@Override
	public String schemaName() {
		return SCHEMA_NAME;
	}

	@Override
	public String tableName() {
		return TABLE_NAME;
	}

	private static final String SCHEMA_NAME = "${table.schema}";
	private static final String TABLE_NAME = "${table.tableName}";
	private static final String FQ_NAME = SCHEMA_NAME + '.' + TABLE_NAME;

}
